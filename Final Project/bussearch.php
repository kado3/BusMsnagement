
<?php include 'connection.php';
include 'topnav.php'
?>

<div class="contanier">
<div class="card card-register mx-auto mt-5">
<div class="card-header"> <h2>Check Record</h2> </div>
<div class="card-body">

<?php
$query = 'SELECT * FROM bus
              WHERE
              BUS_ID ='.$_GET['id'];
            $result = mysqli_query($db, $query) or die(mysqli_error($db));
              while($row = mysqli_fetch_array($result))
              {   
                $bid= $row['BUS_ID'];
                $bname= $row['BUS_NAME'];
                $btype=$row['BUS_TYPE'];
                $did=$row['DRIVER_ID'];
              }
              
              $id = $_GET['id'];
         
?>


                        <form role="form" method="post" action="bus.php">
                            
                            <div class="form-group">
                                <input type="hidden" name="id" value="<?php echo $bid; ?>" />
                            </div>
                            <div class="form-group">
                              <input class="form-control" placeholder="Bus Name" name="BUS_NAME" value="<?php echo $bname; ?>">
                            </div>
                            <div class="form-group">
                              <input class="form-control" placeholder="Bus Type" name="BUS_TYPE" value="<?php echo $btype; ?>">
                            </div> 
                            <div class="form-group">
                              <input class="form-control" placeholder="Driver ID" name="DRIVER_ID" value="<?php echo $did; ?>">
                            </div>
                            <button type="submit" class="btn btn-default">Return to main menu</button>
                         


                      </form>  
                    </div>
                </div>
                
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>

