
<?php 

function getsuppliers() {
global $con;
$query = "SELECT * FROM suppliers";
$result = mysqli_query($con, $query);
$suppliers_count = mysqli_num_rows($result);
if(mysqli_num_rows($result) < 1) {
	// No rows found 
    echo "<div class='alert alert-info'>
           <strong>Info!</strong> No Suppliers Found.
       </div>";
	   return;
} 
	// we found the rows
		 echo "<br /><div class='alert alert-success'>
           <strong>Found: </strong>" . $suppliers_count ." Suppliers</div>";

?>

    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Mobile</th>
		<th>Image</th>
		<th>Action</th>
      </tr>
    </thead>
    <tbody>
	
<?php 	 
$r = 0;

     while ($row = mysqli_fetch_assoc($result)) {
	     $supp_id = $row['sup_id'];
		 $supp_name = $row['name'];
		 $supp_mobile = $row['mobile'];
		 $supp_image = $row['sup_image'];
		 $sup_history = $row['sup_history'];
		 $sup_extra = $row['extra_data'];
		 $r += 1;
		 

?>	

      <tr>
        <td><?php echo $supp_id; ?></td>
        <td><?php echo $supp_name . $r; ?></td>
        <td><?php echo $supp_mobile; ?></td>
		<td><?php echo $supp_image; ?></td>
        <td>
 <button type="button" class="btn btn-success border-success" data-toggle="modal" data-target="#myModal<?php echo $r;?>">View</button>
	 <button class="btn btn-primary border-success">Add</button>
     <button class="btn btn-danger btn btn-info border border-success">Delete</button> <button class="btn btn-info border-success">Update</button>

</td>
      </tr>

<?php }}
	getsuppliers();
?>	  
    </tbody>
  </table>
  


 <?php 
global $con;
$query = "SELECT * FROM suppliers";
$result = mysqli_query($con, $query);
$employess_count = mysqli_num_rows($result);
$r = 0;

   while ($row = mysqli_fetch_assoc($result)) {
     $sup_id = $row['sup_id'];
     $sup_name = $row['name'];
	 $sup_mobile = $row['mobile'];
	 $sup_image = $row['sup_image'];
	 $sup_history = $row['sup_history'];
	 $sup_extra = $row['extra_data'];
	 $r += 1; 

	   
  
  ?>

  <div class="modal fade" id="myModal<?php echo $r;?>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php  echo 'Supplier Name: ' . $sup_name; ?> </h4>
        </div>
        <div class="modal-body">
          <ul class="list-group">
		    <li class="list-group-item list-group-item-info " >Supplier ID:  <?php  echo $sup_id; ?></li>
            <li class="list-group-item list-group-item-primary"> Name:  <?php  echo $sup_name; ?></li>
            <li class="list-group-item list-group-item-success"> Mobile:  <?php  echo $sup_mobile; ?></li>

          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<?php    } ?>





