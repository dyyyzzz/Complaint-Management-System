<?php
session_start();
error_reporting(0);
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
date_default_timezone_set('Asia/Kolkata');// change according timezone
$currentTime = date( 'd-m-Y h:i:s A', time () );


?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin| Dashboard</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">

</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

	<div class="module">
							<div class="module-head">
								<h3>Dashboard</h3>
							</div>
							<div class="module-body table">


<table border="2" align="center" width="80%" style="">
	<tr>
		<th style="color:#000;text-align:center; font-size:16px;">Total</th>
		<th style="color:red;text-align:center; font-size:16px;">Not Processed Yet</th>
		<th style="color:orange;text-align:center;font-size:16px">In Process</th>
		<th style="color:orange;text-align:center;font-size:16px">Not Forwared Pending</th>
		<th style="color:green;text-align:center;font-size:16px">Closed</th>
	</tr>

												<?php
$status='in process';
$rt = mysqli_query($con,"SELECT count(complaintNumber) as totalcomplaint, 
	COUNT(IF((status is null || status=''),0, NULL))  as notprocessedyet,
   COUNT(IF((status='in process'),0, NULL))  as inprocess,
   COUNT(IF((status='closed'),0, NULL))  as closed,
   COUNT(IF(((status is null || status='' || status='$status') and ( complaintNumber not in (SELECT complaintNumber from tblforwardhistory))),0, NULL))  as notforwardedyet
	 FROM tblcomplaints ");
while($row=mysqli_fetch_array($rt))
{
?>

	<tr>
		<th style="color:#000;text-align:center; font-size:14px;"><?php echo $row['totalcomplaint'];?></th>
		<th style="color:#000;text-align:center; font-size:14px;"><a href="notprocess-complaint.php"><?php echo $row['notprocessedyet'];?></a></th>
		<th style="color:#000;text-align:center;font-size:14px"><a href="inprocess-complaint.php"><?php echo $row['inprocess'];?></a></th>
		<th style="color:#000;text-align:center;font-size:14px"><a href="notforwared-pending-complaints.php"><?php echo $row['notforwardedyet'];?></a></th>
		<th style="color:#000;text-align:center;font-size:14px"><a href="closed-complaint.php"><?php echo $row['closed'];?></a></th>
	</tr>
<?php } ?>
</table>


<h3 style="padding-left: 2%; padding-top:3%; color:blue">Sub Admin Data</h3>
<hr />
<table border="2" align="center" width="80%" style="">
	<tr>
		<th style="color:#000;text-align:center; font-size:16px;">Subadmin Name /Dept</th>
		<th style="color:#000;text-align:center; font-size:16px;">Total</th>
		<th style="color:red;text-align:center; font-size:16px;">Not Processed Yet</th>
		<th style="color:orange;text-align:center;font-size:16px">In Process</th>
		<th style="color:green;text-align:center;font-size:16px">Closed</th>
	</tr>

												<?php
//$subid=$_SESSION['suid'];
$sql = mysqli_query($con,"SELECT tblsubadmin.SubAdminName,tblsubadmin.Department,tblsubadmin.id as sid,COUNT(tblcomplaints.complaintNumber) as totalcount,COUNT(IF((status is null || status=''),0, NULL))  as notprocessedyet,
   COUNT(IF((status='in process'),0, NULL))  as inprocess,
   COUNT(IF((status='closed'),0, NULL))  as closed FROM tblcomplaints
join tblforwardhistory on tblforwardhistory.ComplaintNumber=tblcomplaints.complaintNumber
join tblsubadmin on tblsubadmin.id=tblforwardhistory.ForwardTo
 GROUP by tblsubadmin.SubAdminName");
while($result=mysqli_fetch_array($sql))
{?>

	<tr>
		<th style="color:#000;text-align:center; font-size:14px;"><?php echo $result['SubAdminName']."-".$result['Department'];?></th>
		<th style="color:#000;text-align:center; font-size:14px;"><?php echo $total=$result['totalcount'];?></th>
		<th style="color:#000;text-align:center; font-size:14px;"><a href="sa-complaints.php?sid=<?php echo $result['sid'];?>&&type=npy" target="_blank"><?php echo $npy=$result['notprocessedyet'];;?></a></th>
		<th style="color:#000;text-align:center;font-size:14px"><a href="sa-complaints.php?sid=<?php echo $result['sid'];?>&&type=in" target="_blank"><?php echo $in=$result['inprocess'];?></a></th>
		<th style="color:#000;text-align:center;font-size:14px"><a href="sa-complaints.php?sid=<?php echo $result['sid'];?>&&type=clsd" target="_blank"><?php echo $tc=$result['closed'];?></a></th>
	</tr>
<?php 
$gtotal+=$total;
$gnpy+=$npy;
$gin+=$in;
$gtc+=$tc;
} ?>
<tr>
	<th style="color:blue;text-align:center; font-size:16px;">Grand Total</th>
		<th style="color:#000;text-align:center;font-size:16px"><?php echo $gtotal;?></th>
		<th style="color:#000;text-align:center;font-size:16px"><?php echo $gnpy;?></th>
		<th style="color:#000;text-align:center;font-size:16px"><?php echo $gin;?></th>
		<th style="color:#000;text-align:center;font-size:16px"><?php echo $gtc;?></th>
</tr>
</table>
                    </div>
							
							
							</div>
									

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="row">
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body bk-primary text-light">
												<div class="stat-panel text-center">
<?php 
$sql ="SELECT id from users ";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$manusers=$query->rowCount();
?>
													<div class="stat-panel-number h1 "><?php echo htmlentities($manusers);?></div>
													<div class="stat-panel-title text-uppercase">Users</div>
												</div>
											</div>
											<a href="manage-users.php" class="block-anchor panel-footer">Full Detail <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>

<!-- Loading Scripts -->
<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
	

<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
		
		window.onload = function(){
		
			// Line chart from swirlData for dashReport
			var ctx = document.getElementById("dashReport").getContext("2d");
			window.myLine = new Chart(ctx).Line(swirlData, {
				responsive: true,
				scaleShowVerticalLines: false,
				scaleBeginAtZero : true,
				multiTooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
			}); 
			
			// Pie Chart from doughutData
			var doctx = document.getElementById("chart-area3").getContext("2d");
			window.myDoughnut = new Chart(doctx).Pie(doughnutData, {responsive : true});
	
			// Dougnut Chart from doughnutData
			var doctx = document.getElementById("chart-area4").getContext("2d");
			window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, {responsive : true});
	
		}
		</script>
</body>
<?php } ?>