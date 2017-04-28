<?php
//session_start();
if (!isset($_SESSION['apriori_toko_id'])) {
    header("location:index.php?menu=forbidden");
}

include_once "database.php";
include_once "fungsi.php";
include_once "mining.php";
?>
<section class="page_head">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="page_title">
                    <h2>Hasil Rule</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<?php
//object database class
$db_object = new database();

$pesan_error = $pesan_success = "";
if(isset($_GET['pesan_error'])){
    $pesan_error = $_GET['pesan_error'];
}
if(isset($_GET['pesan_success'])){
    $pesan_success = $_GET['pesan_success'];
}

$id_process = 0;
if(isset($_GET['id_process'])){
    $id_process = $_GET['id_process'];
}
$sql = "SELECT
        conf.*, log.start_date, log.end_date
        FROM
         confidence conf, process_log log
        WHERE conf.id_process = '$id_process' "
        . " AND conf.id_process = log.id "
        . " ORDER BY conf.lolos DESC";
//        echo $sql;
$query=$db_object->db_query($sql);
$jumlah=$db_object->db_num_rows($query);
?>

<div class="super_sub_content">
    <div class="container">
        <div class="row">
            <?php
            if($jumlah==0){
                    echo "Data kosong...";
            }
            else{
            ?>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>X => Y</th>
                <th>Support X U Y</th>
                <th>Support X </th>
                <th>Confidence</th>
                </tr>
                <?php
                    $no=1;
                    $data_confidence = array();
                    while($row=$db_object->db_fetch_array($query)){
                            echo "<tr>";
                            echo "<td>".$row['kombinasi1']." => ".$row['kombinasi2']."</td>";
                            echo "<td>".price_format($row['support_xUy'])."</td>";
                            echo "<td>".price_format($row['support_x'])."</td>";
                            echo "<td>".price_format($row['confidence'])."</td>";
                        echo "</tr>";
                        $no++;
                        $data_confidence[] = $row;
                    }
                    ?>
            </table>
            
            <strong>Rule Asosiasi:</strong>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>No</th>
                <th>X => Y</th>
                <th>Confidence</th>
                <th>Nilai Uji lift</th>
                <th>Korelasi rule</th>
                <!--<th></th>-->
                </tr>
                <?php
                    $no=1;
                    //while($row=$db_object->db_fetch_array($query)){
                    foreach($data_confidence as $key => $val){
                        if($no==1){
                            echo "<br>";
                            echo "Min support: ".$val['min_support'];
                            echo "<br>";
                            echo "Min confidence: ".$val['min_confidence'];
                            echo "<br>";
                            echo "Start Date: ".format_date_db($val['start_date']);
                            echo "<br>";
                            echo "End Date: ".format_date_db($val['end_date']);
                        }
                        echo "<tr>";
                        echo "<td>" . $no . "</td>";
                        echo "<td>" . $val['kombinasi1']." => ".$val['kombinasi2'] . "</td>";
                        echo "<td>" . price_format($val['confidence']) . "</td>";
                        echo "<td>" . price_format($val['nilai_uji_lift']) . "</td>";
                        echo "<td>" . ($val['korelasi_rule']) . "</td>";
                        //echo "<td>" . ($val['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
                        echo "</tr>";
                        $no++;
                    }
                    ?>
            </table>
            <h2>Hasil Analisa</h2>
            <table class='table table-bordered table-striped  table-hover'>
                <?php
                $no=1;
                //while($row=$db_object->db_fetch_array($query)){
                foreach($data_confidence as $key => $val){
                    if($val['lolos']==1){
                        echo "<tr>";
                        echo "<td>".$no.". Jika konsumen membeli ".$val['kombinasi1']
                                .", maka konsumen juga akan membeli ".$val['kombinasi2']."</td>";
                        echo "</tr>";
                    }
                    $no++;
                }
                ?>
            </table>
            
            <?php
            //query itemset 1
            $sql1 = "SELECT
                    *
                    FROM
                     itemset1 
                    WHERE id_process = '$id_process' "
                    . " ORDER BY lolos DESC";
            $query1=$db_object->db_query($sql1);
            $jumlah1=$db_object->db_num_rows($query1);
            ?>
            <hr>
            <h3>Perhitungan</h3>
            <strong>Itemset 1:</strong></br>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>Item 1</th>
                <th>Jumlah</th>
                <th>Support</th>
                <th></th>
                </tr>
                <?php
                    while($row1=$db_object->db_fetch_array($query1)){
                            echo "<tr>";
                            echo "<td>".$row1['atribut']."</td>";
                            echo "<td>".$row1['jumlah']."</td>";
                            echo "<td>".price_format($row1['support'])."</td>";
                            echo "<td>".($row1['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                        echo "</tr>";
                    }
                    ?>
            </table>
            
            <?php
            //query itemset 2
            $sql2 = "SELECT
                    *
                    FROM
                     itemset2 
                    WHERE id_process = '$id_process' "
                    . " ORDER BY lolos DESC";
            $query2=$db_object->db_query($sql2);
            $jumlah2=$db_object->db_num_rows($query2);
            ?>
            <hr>
            <strong>Itemset 2:</strong></br>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>Item 1</th>
                <th>Item 2</th>
                <th>Jumlah</th>
                <th>Support</th>
                <th></th>
                </tr>
                <?php
                    while($row2=$db_object->db_fetch_array($query2)){
                            echo "<tr>";
                            echo "<td>".$row2['atribut1']."</td>";
                            echo "<td>".$row2['atribut2']."</td>";
                            echo "<td>".$row2['jumlah']."</td>";
                            echo "<td>".price_format($row2['support'])."</td>";
                            echo "<td>".($row2['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                        echo "</tr>";
                    }
                    ?>
            </table>
            
           <?php
            //query itemset 3
            $sql3 = "SELECT
                    *
                    FROM
                     itemset3 
                    WHERE id_process = '$id_process' "
                    . " ORDER BY lolos DESC";
            $query3=$db_object->db_query($sql3);
            $jumlah3=$db_object->db_num_rows($query3);
            ?>
            <hr>
            <strong>Itemset 3:</strong></br>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>Item 1</th>
                <th>Item 2</th>
                <th>Item 3</th>
                <th>Jumlah</th>
                <th>Support</th>
                <th></th>
                </tr>
                <?php
                    while($row3=$db_object->db_fetch_array($query3)){
                            echo "<tr>";
                            echo "<td>".$row3['atribut1']."</td>";
                            echo "<td>".$row3['atribut2']."</td>";
                            echo "<td>".$row3['atribut3']."</td>";
                            echo "<td>".$row3['jumlah']."</td>";
                            echo "<td>".price_format($row3['support'])."</td>";
                            echo "<td>".($row3['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                        echo "</tr>";
                    }
                    ?>
            </table>
            
            
            
            <?php
            }
            ?>
        </div>
    </div>
</div>
