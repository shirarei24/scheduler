<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.11.custom.min.js"></script>
<script type="text/javascript">
  $(function() {
    $('.open').click(function() {
      $('#modal').dialog({
        modal: true,
        title: 'モーダルダイアログ'
      });
    });
  });
</script>
