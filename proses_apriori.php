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
                    <h2>Proses Apriori</h2>
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

if(isset($_POST['submit'])){
    ?>
    <div class="super_sub_content">
        <div class="container">
            <div class="row">
            <?php
      
    if(empty($_POST['min_support']) || empty($_POST['min_confidence'])){
        ?>
        <script> location.replace("?menu=proses_apriori&pesan_error=Min Support dan Min Confidence harus diisi"); </script>
        <?php
    }
    
    $result = mining_process($db_object, $_POST['min_support'], $_POST['min_confidence']);
    
    if($result){
        display_success("Proses mining selesai");
    }
    else{
        display_error("Gagal mendapatkan aturan asosiasi"); 
    }
    echo "Min Support: ".$_POST['min_support'];
    echo "<br>";
    echo "Min Confidence: ".$_POST['min_confidence'];
    echo "<br>";
    ?>
        <strong>Itemset 1:</strong>
        <table class='table table-bordered table-striped  table-hover'>
            <tr>
            <th>No</th>
            <th>Item</th>
            <th>Jumlah</th>
            <th>Support</th>
            <th></th>
            </tr>
            <?php
                $sql1 = "SELECT * FROM itemset1 ORDER BY lolos DESC";
                $query1 = $db_object->db_query($sql1);
                $no=1;
                while($row1=$db_object->db_fetch_array($query1)){
                    echo "<tr>";
                        echo "<td>".$no."</td>";
                        echo "<td>".$row1['atribut']."</td>";
                        echo "<td>".$row1['jumlah']."</td>";
                        echo "<td>".$row1['support']."</td>";
                        echo "<td>".($row1['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
        </table>
        
        <strong>Itemset 2:</strong>
        <table class='table table-bordered table-striped  table-hover'>
            <tr>
            <th>No</th>
            <th>Item 1</th>
            <th>Item 2</th>
            <th>Jumlah</th>
            <th>Support</th>
            <th></th>
            </tr>
            <?php
                $sql1 = "SELECT * FROM itemset2 ORDER BY lolos DESC";
                $query1 = $db_object->db_query($sql1);
                $no=1;
                while($row1=$db_object->db_fetch_array($query1)){
                    echo "<tr>";
                        echo "<td>".$no."</td>";
                        echo "<td>".$row1['atribut1']."</td>";
                        echo "<td>".$row1['atribut2']."</td>";
                        echo "<td>".$row1['jumlah']."</td>";
                        echo "<td>".$row1['support']."</td>";
                        echo "<td>".($row1['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
        </table>
        
        <strong>Itemset 3:</strong>
        <table class='table table-bordered table-striped  table-hover'>
            <tr>
            <th>No</th>
            <th>Item 1</th>
            <th>Item 2</th>
            <th>Item 3</th>
            <th>Jumlah</th>
            <th>Support</th>
            <th></th>
            </tr>
            <?php
                $sql1 = "SELECT * FROM itemset3 ORDER BY lolos DESC";
                $query1 = $db_object->db_query($sql1);
                $no=1;
                while($row1=$db_object->db_fetch_array($query1)){
                    echo "<tr>";
                        echo "<td>".$no."</td>";
                        echo "<td>".$row1['atribut1']."</td>";
                        echo "<td>".$row1['atribut2']."</td>";
                        echo "<td>".$row1['atribut3']."</td>";
                        echo "<td>".$row1['jumlah']."</td>";
                        echo "<td>".$row1['support']."</td>";
                        echo "<td>".($row1['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
        </table>
        
        <strong>Confidence:</strong>
        <table class='table table-bordered table-striped  table-hover'>
            <tr>
                <th>No</th>
                <th>Rule</th>
                <th>Confidence</th>
                <th></th>
            </tr>
            <?php
                $sql1 = "SELECT * FROM confidence ORDER BY lolos DESC";
                $query1 = $db_object->db_query($sql1);
                $no=1;
                while($row1=$db_object->db_fetch_array($query1)){
                    $kom1 = explode(" , ",$row1['kombinasi1']);
                    $jika = implode(" Dan ", $kom1);
                    $kom2 = explode(" , ",$row1['kombinasi2']);
                    $maka = implode(" Dan ", $kom2);
                    echo "<tr>";
                        echo "<td>".$no."</td>";
                        echo "<td>Jika ".$jika.", Maka ".$maka."</td>";
                        echo "<td>".price_format($row1['confidence'])."</td>";
                        echo "<td>".($row1['lolos']==1?"Lolos":"Tidak Lolos")."</td>";
                    echo "</tr>";
                    $no++;
                }
                ?>
        </table>
        
            </div>
        </div>
    </div>
    <?php
}
else{

$sql = "SELECT
        *
        FROM
         transaksi";
$query=$db_object->db_query($sql);
$jumlah=$db_object->db_num_rows($query);
?>

<div class="super_sub_content">
    <div class="container">
        <div class="row">
            <form method="post" action="">
                <div class="row">
                <div class="col-lg-6">
                <div class="form-group">
                    <input name="min_support" type="text" class="form-control" required="" placeholder="Min Support">
                </div>
                <div class="form-group">
                    <input name="min_confidence" type="text" class="form-control" required="" placeholder="Min Confidence">
                </div>
                <div class="form-group">
                    <input name="submit" type="submit" value="Proses" class="btn btn-success">
                </div>
                </div>
                </div>
            </form>

            <?php
            if (!empty($pesan_error)) {
                display_error($pesan_error);
            }
            if (!empty($pesan_success)) {
                display_success($pesan_success);
            }


            echo "Jumlah data: ".$jumlah."<br>";
            if($jumlah==0){
                    echo "Data kosong...";
            }
            else{
            ?>
            <table class='table table-bordered table-striped  table-hover'>
                <tr>
                <th>No</th>
                <th>Tanggal</th>
                <th>Produk</th>
                </tr>
                <?php
                    $no=1;
                    while($row=$db_object->db_fetch_array($query)){
                        echo "<tr>";
                            echo "<td>".$no."</td>";
                            echo "<td>".$row['transaction_date']."</td>";
                            echo "<td>".$row['produk']."</td>";
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
<?php
}