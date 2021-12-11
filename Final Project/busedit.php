<?php include 'connection.php';
include 'topnav.php'; ?>

<div class="contanier">
<div class="card card-register mx-auto mt-5">
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

             <div class="col-lg-12" style="background-image: linear-gradient(black, #014923);">
                  <h1>Edit Records</h1>
                      <div class="col-lg-6"> 

                        <form role="form" method="post" action="busedit1.php">
                            
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
                              <input class="form-control" placeholder="DRIVER ID" name="DRIVER_ID" value="<?php echo $did; ?>">

                           <br></br>
                            <button type="submit" class="btn btn-default">Update Record</button>
                         


                      </form>  
                    </div>
                </div>
                
            </div>
            <!-- /.container-fluid -->

        </div>
        <?php include 'footer.php'; ?>