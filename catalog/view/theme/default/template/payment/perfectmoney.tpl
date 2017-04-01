<form action="<?php echo $action; ?>" method="POST">
<input type="hidden" name="PAYEE_ACCOUNT" value="<?php echo $PAYEE_ACCOUNT; ?>">
<input type="hidden" name="PAYEE_NAME" value="<?php echo $PAYEE_NAME; ?>">
<input type="hidden" name="PAYMENT_ID" value="<?php echo $PAYMENT_ID; ?>">
<input type="hidden" name="PAYMENT_AMOUNT" value="<?php echo $PAYMENT_AMOUNT; ?>">
<input type="hidden" name="PAYMENT_UNITS" value="<?php echo $PAYMENT_UNITS; ?>">
<input type="hidden" name="STATUS_URL" value="<?php echo $STATUS_URL; ?>">
<input type="hidden" name="PAYMENT_URL" value="<?php echo $PAYMENT_URL; ?>">
<input type="hidden" name="PAYMENT_URL_METHOD" value="<?php echo $PAYMENT_URL_METHOD; ?>">
<input type="hidden" name="NOPAYMENT_URL" value="<?php echo $NOPAYMENT_URL; ?>">
<input type="hidden" name="NOPAYMENT_URL_METHOD" value="<?php echo $NOPAYMENT_URL_METHOD; ?>">
<input type="hidden" name="SUGGESTED_MEMO" value="<?php echo $SUGGESTED_MEMO; ?>">
<input type="hidden" name="BAGGAGE_FIELDS" value="">
   <div class="buttons">
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
    </div>
  </div>
</form>
<?php die('111111'); ?>