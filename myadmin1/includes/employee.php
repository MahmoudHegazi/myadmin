
<?php 

function getempolyess() {
global $con;
$query = "SELECT * FROM employees";
$result = mysqli_query($con, $query);
$employess_count = mysqli_num_rows($result);
if(mysqli_num_rows($result) < 1) {
	// No rows found 
    echo "<div class='alert alert-info'>
           <strong>Info!</strong> No Employess Found.
       </div>";
	   return;
} 
	// we found the rows
		 echo "<br /><div class='alert alert-success'>
           <strong>Found: </strong>" . $employess_count ." Employees</div>";

?>

    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Title</th>
		<th>Department</th>
		<th>Actions</th>
      </tr>
    </thead>
    <tbody>
	
<?php 	 
$r = 0;
     while ($row = mysqli_fetch_assoc($result)) {
	     $emp_id = $row['id'];
		 $emp_name = $row['name'];
		 $emp_location = $row['location'];
		 $emp_creator = $row['creator_id'];
		 $emp_sup = $row['sup_location'];
		 $emp_resigned = $row['resigned'];
         $emp_title = $row['job_title'];
         $emp_empid = $row['employee_id'];
         $emp_dep = $row['department'];
		 $r += 1;
     
?>	

      <tr>
        <td><?php echo $emp_empid; ?></td>
        <td><?php echo $emp_name; ?></td>
        <td><?php echo $emp_title; ?></td>
		<td><?php echo $emp_dep; ?></td>

        <td>
     <button type="button" class="btn btn-success border-success" data-toggle="modal" data-target="#myModal<?php echo $r;?>">View</button>
	 <button class="btn btn-primary border-success">Add</button>
     <button class="btn btn-danger btn btn-info border border-success">Delete</button> <button class="btn btn-info border-success">Update</button></td>
      </tr>

<?php }}
	getempolyess();
?>	  
    </tbody>
  </table>



  
  <?php 
global $con;
$query = "SELECT * FROM employees";
$result = mysqli_query($con, $query);
$employess_count = mysqli_num_rows($result);
$r = 0;
       while ($row = mysqli_fetch_assoc($result)) {
	     $emp_id = $row['id'];
		 $emp_name = $row['name'];
		 $emp_location = $row['location'];
		 $emp_creator = $row['creator_id'];
		 $emp_sup = $row['sup_location'];
		 $emp_resigned = $row['resigned'];
         $emp_title = $row['job_title'];
         $emp_empid = $row['employee_id'];
         $emp_dep = $row['department'];
		 $r += 1;

	   
  
  ?>

  <!-- Modal -->
  <div class="modal fade" id="myModal<?php echo $r;?>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php  echo 'Employee Name: ' . $emp_name; ?> </h4>
        </div>
        <div class="modal-body">
          <ul class="list-group">
		    <li class="list-group-item list-group-item-info " >Employee ID:  <?php  echo $emp_empid; ?></li>
            <li class="list-group-item list-group-item-success"> Title:  <?php  echo $emp_title; ?></li>
            <li class="list-group-item list-group-item-warning"> Department:  <?php  echo $emp_dep; ?></li>
            <li class="list-group-item list-group-item-info"> Location:  <?php  echo  $emp_location; ?></li>
			<li class="list-group-item list-group-item-success"> Sup Location:  <?php echo  $emp_sup; ?></li>
            <li class="list-group-item list-group-item-danger"> Resigned:  <?php  echo $emp_resigned; ?></li>
			<li class="list-group-item list-group-item-info"> System Id:  <?php  echo $emp_id; ?></li>
			<li class="list-group-item list-group-item-success"> Added By:  <?php  echo $emp_creator; ?></li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<?php 	   } ?>