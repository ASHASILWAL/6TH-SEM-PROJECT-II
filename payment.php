<html>
    
    <head> 
    <script src="https://khalti.s3.ap-south-1.amazonaws.com/KPG/dist/2020.12.17.0.0.0/khalti-checkout.iffe.js"></script>
    </head> 
    
    <body>
       
       <button> <a href="#" data-amount=30 id='payment-button-1' class="btn btn-primary pay-khalti">Pay with Khalti</a> </button>

        


</body>

</html>


<link rel="stylesheet" href="https://rawgit.com/google/code-prettify/master/styles/sons-of-obsidian.css" />
<script src="khalti-client.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
        // just show the live js here.
        $.ajax({url: "khalti-client.js", success: function(resp){
            $("#js-code-here").text(resp.trim());
            addEventListener('load', function(event) { PR.prettyPrint(); }, false);
        }, dataType: 'html'});
        $.get({url: "example.js", success: function(resp){
            $("#js-example-here").text(resp.trim());
            addEventListener('load', function(event) { PR.prettyPrint(); }, false);
        }, dataType: 'html'});
    });
</script>