<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
	
	
	<table class="table table-hover">
	<tr>
		<td>ORDER ID</td>
		<td>TOTAL PAY AMOUNT</td>
		<td>PAYMENT TYPE</td>
		
		
		
	</tr>
	</tr>
	<?php
	//$orderID=$this->session->data['order_id'];
	//echo $orderID;
	
	//echo $order_id;
	
	$con=mysqli_connect("localhost","root","","webstore");
		$sql="SELECT * FROM oc_order ORDER BY order_id DESC LIMIT 1";

$result=mysqli_query($con,$sql);
	
	
	while($row=mysqli_fetch_assoc($result)){
	echo '<td><strong>'. $row["order_id"].'</strong></td>';
	
	echo '<td><strong>£'.$row["total"].'</strong></td>';
	echo "<td>";
	
	?>
		<form action="https://secure.worldpay.com/wcc/purchase" method=POST>
  <input type='hidden' name='instId' value='1155311'/>
  <input type='hidden' name='amount' value='<?php echo $row["total"];?>'/>
  <input type='hidden' name='cartId' value='<?php echo $row["order_id"]; ?>'/>
  <input type='hidden' name='currency' value='GBP'/>
  <input type='hidden' name='testMode' value='0'/>
  <input type='submit' class="btn btn-danger" value='Make Payment'/>
  <img src="image/catalog/Capture2.PNG"/>
</form>
	
	
	<?php

	
	echo "</td>";
	}
	
	?>
	</tr>
	</table>
	
	
	
	
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo "Continue Shopping"; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>