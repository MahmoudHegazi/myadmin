<?php include 'db.php'; ?>
<?php 		 

function deletedevice() {
  global $con;
  if (isset($_GET['delete_device'])) {
    $dev_id = $_GET['delete_device'];
    $query = "DELETE FROM workstation WHERE id =" . $dev_id;
    $result = mysqli_query($con, $query);
    if (!$result) {
    

		//echo "Can't Delete This Device It Has Ticket in maintance you Had To delete The Ticket";
      
      
  

	  die("Can't Delete This Device It Has Ticket in maintenance you Have To delete The Ticket First 
<a href='workstation.php'><button class='btn btn-danger'>Back</button></a>");


	  //"Could not delete data " . 
    }
    else{
		header("Location: workstation.php?device_deleted");
    }
  }

}

deletedevice();

?>