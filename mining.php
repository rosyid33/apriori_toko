<?php

/* 
 * Proses mining function
 */

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
    $itemset2_var1 = $itemset2_var2 = array();
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
                            $itemset2_var1[] = $variance1;
                            $itemset2_var2[] = $variance2;
                        }
                    }
                }
            }
            $b++;
        }
        $a++;
    }
    
    //build itemset3
    $a = 0;
    $tigaVariasiItem = array();
    while ($a <= count($itemset2_var1)) {
        $b = 0;
        while ($b <= count($itemset2_var1)) {
            if($a != $b){
                $itemset1a = $itemset2_var1[$a];
                $itemset1b = $itemset2_var1[$b];

                $itemset2a = $itemset2_var2[$a];
                $itemset2b = $itemset2_var2[$b];

                if (!empty($itemset1a) && !empty($itemset1b)&& !empty($itemset2a) && !empty($itemset2b)) {
                    $temp_array = get_variasi_itemset3($tigaVariasiItem, 
                            $itemset1a, $itemset1b, $itemset2a, $itemset2b);
                    
                    if(count($temp_array)>0){
                        //variasi-variasi itemset isi ke array
                        $tigaVariasiItem = array_merge($tigaVariasiItem, $temp_array);
                        
                        foreach ($temp_array as $idx => $val_nilai) {
                            $itemset1 = $itemset2 = $itemset3 = "";
                            
                            $aaa=0;
                            foreach ($val_nilai as $idx1 => $v_nilai) {
                                if($aaa==0){
                                    $itemset1 = $v_nilai;
                                }
                                if($aaa==1){
                                    $itemset2 = $v_nilai;
                                }
                                if($aaa==2){
                                    $itemset3 = $v_nilai;
                                }
                                $aaa++;
                            }
                            
                            //jumlah item set3 dan menghitung supportnya
                            $jml_itemset3 = get_count_itemset3($db_object, $itemset1, $itemset2, $itemset3);
                            $support3 = ($jml_itemset3/$jumlah_transaksi) * 100;
                            $lolos = ($support3 >= $min_support)? 1:0;
                            //masukkan ke table itemset3
                            $db_object->insert_record("itemset3", array("atribut1" => $itemset1,
                                "atribut2" => $itemset2,
                                "atribut3" => $itemset3,
                                "jumlah" => $jml_itemset3,
                                "support" => $support3,
                                "lolos" => $lolos
                            ));
                        }
                    }
                    
                }
            }
            $b++;
        }
        $a++;
    }
}


function get_variasi_itemset3($array_itemset3, $item1, $item2, $item3, $item4) {
    $return = array();
    
    $return1 = array();
    if(!in_array($return1, $item1)){
        $return1[] = $item1;
    }
    if(!in_array($return1, $item2)){
        $return1[] = $item2;
    }
    if(!in_array($return1, $item3)){
        $return1[] = $item3;
    }
    
    $return2 = array();
    if(!in_array($return2, $item1)){
        $return2[] = $item1;
    }
    if(!in_array($return2, $item2)){
        $return2[] = $item2;
    }
    if(!in_array($return2, $item4)){
        $return2[] = $item4;
    }
    
    $return3 = array();
    if(!in_array($return3, $item1)){
        $return3[] = $item1;
    }
    if(!in_array($return3, $item3)){
        $return3[] = $item3;
    }
    if(!in_array($return3, $item4)){
        $return3[] = $item4;
    }
    
    $return4 = array();
    if(!in_array($return4, $item2)){
        $return4[] = $item2;
    }
    if(!in_array($return4, $item3)){
        $return4[] = $item3;
    }
    if(!in_array($return4, $item4)){
        $return4[] = $item4;
    }
    
    if(count($return1)==3){
        if(!is_exist_variasi_on_itemset3($return, $return1)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return1)){
                $return[] = $return1;
            }
        }
    }
    if(count($return2)==3){
        if(!is_exist_variasi_on_itemset3($return, $return2)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return2)){
                $return[] = $return2;
            }
        }
    }
    if(count($return3)==3){
        if(!is_exist_variasi_on_itemset3($return, $return3)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return3)){
                $return[] = $return3;
            }
        }
    }
    if(count($return4)==3){
        if(!is_exist_variasi_on_itemset3($return, $return4)){
            if(!is_exist_variasi_on_itemset3($array_itemset3, $return4)){
                $return[] = $return4;
            }
        }
    }
    return $return;
}

function is_exist_variasi_on_itemset3($array, $tiga_variasi){
    $return = false;
    
    foreach ($array as $key => $value) {
        $jml=0;
        foreach ($value as $key1 => $val1) {
            foreach ($tiga_variasi as $key2 => $val2) {
                if($val1 == $val2){
                    $jml++;
                }
            }
        }
        if($jml==3){
            $return=true;
            break;
        }
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
