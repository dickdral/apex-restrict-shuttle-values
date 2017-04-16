// APEX Restrict Shuttle Values
// Author: Dick Dral (Detora)
// Version: 1.0
// Date: April 14th, 2017

// global namespace
var apex_restrict_shuttle_values = {

restrict_values: function ( search_item, shuttle_item )
{
  console.log('perform Restrict shuttle values');

  var search = apex.item(search_item).getValue();
  search = search.toLowerCase();

  search_words = search.split(' ');
    console.log('search_words=' , search_words
         );    
    
  var items_hidden = false;
  $('#'+shuttle_item+'_LEFT option').each(
      function() 
      {
         var text = $(this).text().toLowerCase();

         var visible = true;  
         if ( search.length > 0 )
         {
           for ( i = 0; i < search_words.length; i++)
           { 
              if ( text.indexOf(search_words[i]) < 0 ) 
              { visible = false; }
           }
         }

         if ( visible ) 
         {  $(this).show(); }
         else
         {  $(this).hide(); 
            items_hidden = true;
         }

       }
   );  
   if ( items_hidden )
   {   $('#'+shuttle_item+'_MOVE_ALL').addClass('apex_disabled');
   }
    else
   {   $('#'+shuttle_item+'_MOVE_ALL').removeClass('apex_disabled');
   }
        
},

    // function that gets called from plugin
    doIt: function() {
        // plugin attributes
        var daThis = this;
        var search_item  = this.triggeringElement.id;
        var shuttle_item = daThis.affectedElements[0].id;
        console.log(search_item, shuttle_item);
        apex_restrict_shuttle_values.restrict_values(search_item,shuttle_item);
    }
};
