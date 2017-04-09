<?php

function display_process_hasil_mining($db_object, $id_process) {
//    ?>
<!--    <strong>Itemset 1:</strong>
    <table class = 'table table-bordered table-striped  table-hover'>
    <tr>
    <th>No</th>
    <th>Item</th>
    <th>Jumlah</th>
    <th>Support</th>
    <th></th>
    </tr>-->
    <?php
//    $sql1 = "SELECT * FROM itemset1 "
//            . " WHERE id_process = ".$id_process
//            . " ORDER BY lolos DESC";
//    $query1 = $db_object->db_query($sql1);
//    $no = 1;
//    while ($row1 = $db_object->db_fetch_array($query1)) {
//        echo "<tr>";
//        echo "<td>" . $no . "</td>";
//        echo "<td>" . $row1['atribut'] . "</td>";
//        echo "<td>" . $row1['jumlah'] . "</td>";
//        echo "<td>" . $row1['support'] . "</td>";
//        echo "<td>" . ($row1['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
//        echo "</tr>";
//        $no++;
//    }
//    ?>
    <!--</table>-->


<!--    <strong>Itemset 2:</strong>
    <table class='table table-bordered table-striped  table-hover'>
        <tr>
            <th>No</th>
            <th>Item 1</th>
            <th>Item 2</th>
            <th>Jumlah</th>
            <th>Support</th>
            <th></th>
        </tr>-->
        <?php
//        $sql1 = "SELECT * FROM itemset2 "
//                . " WHERE id_process = ".$id_process
//                . " ORDER BY lolos DESC";
//        $query1 = $db_object->db_query($sql1);
//        $no = 1;
//        while ($row1 = $db_object->db_fetch_array($query1)) {
//            echo "<tr>";
//            echo "<td>" . $no . "</td>";
//            echo "<td>" . $row1['atribut1'] . "</td>";
//            echo "<td>" . $row1['atribut2'] . "</td>";
//            echo "<td>" . $row1['jumlah'] . "</td>";
//            echo "<td>" . $row1['support'] . "</td>";
//            echo "<td>" . ($row1['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
//            echo "</tr>";
//            $no++;
//        }
//        ?>
<!--    </table>

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
        </tr>-->
        <?php
//        $sql1 = "SELECT * FROM itemset3 "
//                . " WHERE id_process = ".$id_process
//                . " ORDER BY lolos DESC";
//        $query1 = $db_object->db_query($sql1);
//        $no = 1;
//        while ($row1 = $db_object->db_fetch_array($query1)) {
//            echo "<tr>";
//            echo "<td>" . $no . "</td>";
//            echo "<td>" . $row1['atribut1'] . "</td>";
//            echo "<td>" . $row1['atribut2'] . "</td>";
//            echo "<td>" . $row1['atribut3'] . "</td>";
//            echo "<td>" . $row1['jumlah'] . "</td>";
//            echo "<td>" . $row1['support'] . "</td>";
//            echo "<td>" . ($row1['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
//            echo "</tr>";
//            $no++;
//        }
//        ?>
    <!--</table>-->




    <strong>Rule Asosiasi yang terbentuk:</strong>
    <table class='table table-bordered table-striped  table-hover'>
        <tr>
            <th>No</th>
            <th>Rule</th>
            <th>Confidence</th>
            <th></th>
        </tr>
        <?php
        $sql1 = "SELECT * FROM confidence "
                . " WHERE id_process = ".$id_process
                . " ORDER BY lolos DESC";
        $query1 = $db_object->db_query($sql1);
        $no = 1;
        while ($row1 = $db_object->db_fetch_array($query1)) {
            $kom1 = explode(" , ", $row1['kombinasi1']);
            $jika = implode(" Dan ", $kom1);
            $kom2 = explode(" , ", $row1['kombinasi2']);
            $maka = implode(" Dan ", $kom2);
            echo "<tr>";
            echo "<td>" . $no . "</td>";
            echo "<td>Jika " . $jika . ", Maka " . $maka . "</td>";
            echo "<td>" . price_format($row1['confidence']) . "</td>";
            echo "<td>" . ($row1['lolos'] == 1 ? "Lolos" : "Tidak Lolos") . "</td>";
            echo "</tr>";
            $no++;
        }
        ?>
    </table>

    <?php
}
?>