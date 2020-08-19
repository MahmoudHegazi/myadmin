		 <!-- delete -->

<?php 

function getdevices() {
global $con;
$query = "SELECT * FROM workstation";
$result = mysqli_query($con, $query);
$devices_count = mysqli_num_rows($result);
if(mysqli_num_rows($result) < 1) {
	// No rows found 
    echo "<div class='alert alert-info'>
           <strong>Info!</strong> No Device Found.
       </div>";
	   return;
} 
	// we found the rows
		 echo "<br /><div class='alert alert-success'>
           <strong>Found: </strong>" . $devices_count ." Devices</div>";

?>

    <thead>
      <tr>
        <th>ID</th>
        <th>Service Tag</th>
        <th>purchased</th>
        <th>Supplier</th>
	<th>Price</th>
	<th>Actions</th>
      </tr>
    </thead>
    <tbody>
	
<?php 	 
$r = 0;
     while ($row = mysqli_fetch_assoc($result)) {
	     $device_id = $row['id'];
		 $device_tag = $row['service_tag'];
         $device_man = $row['manufacture'];
		 $device_purchased = $row['purchased_date'];
		 $device_supplier_id = $row['supplier_id'];
		 $device_price = $row['price'];
		 $device_history = $row['history'];
		 $device_status = $row['status'];
		 $device_images = $row['images'];
		 $device_model = $row['model'];
		 $device_type = $row['type'];
		 $r += 1;
		 $super_query = "SELECT name FROM suppliers WHERE sup_id=" . $device_supplier_id;
		 $res1 = mysqli_query($con, $super_query);
		 while ($record1 = mysqli_fetch_assoc($res1)) {
			$supp_name = $record1['name'];
		 }		 
?>	

      <tr>
        <td><?php echo $device_id; ?></td>
        <td><?php echo $device_tag; ?></td>
        <td><?php echo $device_purchased; ?></td>
		<td><?php echo $supp_name; ?></td>
		<td><?php echo $device_price; ?></td>
        <td>
		<button type="button" class="btn btn-success border-success" data-toggle="modal" data-target="#myModal<?php echo $r;?>">View</button>
		<button class="btn btn-primary border-success">Add</button>
		<a href='workstation.php?delete_device=<?php echo $device_id ?>'><button class="btn btn-danger">Delete</button></a> <button class="btn btn-info">update</button>
		</td>
      </tr>

<?php }}
	getdevices();
?>	  
    </tbody>
  </table>
  

  
  
 <?php
global $con;
$query = "SELECT * FROM workstation";

$result = mysqli_query($con, $query);
$devices_count = mysqli_num_rows($result);
$r = 0;
     while ($row = mysqli_fetch_assoc($result)) {
	     $device_id = $row['id'];
		 $device_tag = $row['service_tag'];
         $device_man = $row['manufacture'];
		 $device_purchased = $row['purchased_date'];
		 $device_supplier_id = $row['supplier_id'];
		 $device_price = $row['price'];
		 $device_history = $row['history'];
		 $device_status = $row['status'];
		 $device_images = $row['images'];
		 $device_model = $row['model'];
		 $device_type = $row['type'];
		 $r += 1;
		 $sup_query = "SELECT name FROM suppliers WHERE sup_id=" . $device_supplier_id;
		 $res = mysqli_query($con, $sup_query);
		 
		 while ($record = mysqli_fetch_assoc($res)) {
			$supplier_name = $record['name'];
		 }
?>
  

  <div class="modal fade" id="myModal<?php echo $r;?>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php  echo 'Service Tag: ' . $device_tag; ?> </h4>
        </div>
        <div class="modal-body">
          <ul class="list-group">
		    <li class="list-group-item list-group-item-info " >ID:  <?php  echo $device_id; ?></li>
			<li class="list-group-item list-group-item-success"> Type:  <?php  echo $device_type; ?></li>
			<li class="list-group-item list-group-item-success"> Status:  <?php  echo $device_status; ?></li>
            <li class="list-group-item list-group-item-primary"> Manufacture:  <?php  echo $device_model; ?></li>
			<li class="list-group-item list-group-item-primary"> Model:  <?php  echo $device_man; ?></li>
            <li class="list-group-item list-group-item-success"> purchased date:  <?php  echo $device_purchased; ?></li>
		    <li class="list-group-item list-group-item-info " > Supplier:  <?php  echo $supplier_name; ?></li>
            <li class="list-group-item list-group-item-primary"> Price:  <?php  echo $device_price; ?></li>
            <li class="list-group-item list-group-item-success"> Status:  <?php  echo $device_status; ?></li>			
          </ul>
		   
	
		     <!-- Supplier History -->
			 <h2>History</h2>
             <p><?php echo $device_history; ?></p>
      
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
		 <?php  } ?>  
		 
		 
		 


