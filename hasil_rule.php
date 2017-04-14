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

$sql = "SELECT
        *
        FROM
         process_log ";
$query=$db_object->db_query($sql);
$jumlah=$db_object->db_num_rows($query);
?>

<div class="super_sub_content">
    <div class="container">
        <div class="row">
<!--            <form method="post" action="">
                <div class="form-group">
                    <input name="submit" type="submit" value="Proses" class="btn btn-success">
                </div>
            </form>-->

            <?php
            if (!empty($pesan_error)) {
                display_error($pesan_error);
            }
            if (!empty($pesan_success)) {
                display_success($pesan_success);
            }


            //echo "Jumlah data: ".$jumlah."<br>";
            if($jumlah==0){
                    echo "Data kosong...";
            }
            else{
            ?>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>No</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Min Support</th>
                <th>Min Confidence</th>
                <th></th>
                </tr>
                <?php
                    $no=1;
                    while($row=$db_object->db_fetch_array($query)){
//                        if($no==1){
//                            echo "Min support: ".$row['min_support'];
//                            echo "<br>";
//                            echo "Min confidence: ".$row['min_confidence'];
//                        }
//                        $kom1 = explode(" , ",$row['kombinasi1']);
//                        $jika = implode(" Dan ", $kom1);
//                        $kom2 = explode(" , ",$row['kombinasi2']);
//                        $maka = implode(" Dan ", $kom2);
                            echo "<tr>";
                            echo "<td>".$no."</td>";
                            echo "<td>".$row['start_date']."</td>";
                            echo "<td>".$row['end_date']."</td>";
                            echo "<td>".$row['min_support']."</td>";
                            echo "<td>".$row['min_confidence']."</td>";
                            $view = "<a href='index.php?menu=view_rule&id_process=".$row['id']."'>View rule</a>";
                            echo "<td>".$view."</td>";
//                            echo "<td>Jika ".$jika.", Maka ".$maka."</td>";
//                            echo "<td>".price_format($row['confidence'])."</td>";
                        echo "</tr>";
                        $no++;
                    }
                    ?>
            </table>
            <?php
            }
            ?>
        </div>
    </div>
</div>
