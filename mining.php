<?php

/* 
 * Proses mining function
 */

function mining_process($db_object, $min_support=20, $min_confidence=85){
    reset_temporary($db_object);
    $sql = "SELECT transaction_date FROM transaksi GROUP BY transaction_date";
    $query=$db_object->db_query($sql);
    $jumlah_transaksi=$db_object->db_num_rows($query);
    
    //bulid itemset1
    $sql1 = "SELECT
            produk,
            COUNT(produk) AS jml,
            (COUNT(produk) / $jumlah_transaksi) * 100 AS support
          FROM
            transaksi
          WHERE produk != ''
          GROUP BY produk";
    $query1=$db_object->db_query($sql1);
    $itemset1 = array();
    while($row = $db_object->db_fetch_array($query1)){
        $produk = $row['produk'];
        $jml = $row['jml'];
        $support = $row['support'];
        $lolos = ($support >= $min_support)? 1:0;
        $field_value = array(
                        "atribut"=>($produk),
                        "jumlah"=>$jml,
                        "support"=>$support,
                        "lolos"=>$lolos
                    );
        $query = $db_object->insert_record("itemset1", $field_value);
        
        if($lolos){
            $itemset1[] = $produk;
        }
    }
    
    //build itemset2
    $a = 0;
    $NilaiAtribut1 = $NilaiAtribut2 = array();
    $itemset2 = array();
    while ($a <= count($itemset1)) {
        $b = 0;
        while ($b <= count($itemset1)) {
            $variance1 = $itemset1[$a];
            $variance2 = $itemset1[$b];
            if (!empty($variance1) && !empty($variance2)) {
                if ($variance1 != $variance2) {
                    if(!is_exist_variasi_itemset($NilaiAtribut1, $NilaiAtribut2, $variance1, $variance2)) {
                        $jml_itemset2 = get_count_itemset2($db_object, $variance1, $variance2);
                        $NilaiAtribut1[] = $variance1;
                        $NilaiAtribut2[] = $variance2;

                        $support2 = ($jml_itemset2/$jumlah_transaksi) * 100;
                        $lolos = ($support2 >= $min_support)? 1:0;
                        //masukkan ke table itemset2
                        $db_object->insert_record("itemset2", 
                        array("atribut1" => $variance1,
                                "atribut2" => $variance2,
                                "jumlah" => $jml_itemset2,
                                "support" => $support2,
                                "lolos" => $lolos
                        ));     
                        
                        if($lolos){
                            $itemset2[]['item1'] = $variance1;
                            $itemset2[]['item2'] = $variance2;
                        }
                    }
                }
            }
            $b++;
        }
        $a++;
    }
    
    //build itemset3
    
}

function reset_temporary($db_object){
    $sql1 = "TRUNCATE itemset1";
    $db_object->db_query($sql1);
    
    $sql2 = "TRUNCATE itemset2";
    $db_object->db_query($sql2);
    
    $sql3 = "TRUNCATE itemset3";
    $db_object->db_query($sql3);
    
    $sql4 = "TRUNCATE confidence";
    $db_object->db_query($sql4);
}

function is_exist_variasi_itemset($array_item1, $array_item2, $item1, $item2) {
    $return = true;

    $bool1 = in_array($item2, $array_item1);
    $bool2 = in_array($item1, $array_item2);
    if (!$bool1 || !$bool2) {
        $return = false;
    }
    return $return;
}

function get_count_itemset2($db_object, $atribut1, $atribut2) {
    $sql = "SELECT COUNT(transaction_date) AS jml, transaction_date 
            FROM transaksi 
            WHERE (produk='$atribut1' OR produk = '$atribut2') 
            GROUP BY transaction_date
            HAVING COUNT(transaction_date)=2";
    $result = $db_object->db_query($sql);
    $jml = $db_object->db_num_rows($result);
    return $jml;
}

function get_count_itemset3($db_object, $atribut1, $atribut2, $atribut3) {
    $sql = "SELECT COUNT(transaction_date) AS jml, transaction_date FROM transaksi 
            WHERE (produk='$atribut1' OR produk = '$atribut2'  OR produk = '$atribut3') 
            GROUP BY transaction_date
            HAVING COUNT(transaction_date)=3";
    $result = $db_object->db_query($sql);
    $jml = $db_object->db_num_rows($result);
    return $jml;
}