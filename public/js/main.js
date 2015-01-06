
$(window).load(function() { //start after HTML, images have loaded
 
    var BackgroundRotator =
    {
        init: function($elem, imagePaths)
        {
            //interval between items (in milliseconds)
            var itemInterval = 10000;

            //count number of items
            var numberOfItems = imagePaths.length;
 
            //set current item
            var currentItem = 0;
 
            // preload images
            for(var i = 0; i < imagePaths.length; i++ ) {
              var imageObject = new Image();
              imageObject.src = imagePaths[i];
            }

            //loop through the items
            var infiniteLoop = setInterval(function(){

                $elem.css('background', 'url(' + imagePaths[currentItem] + ')');

                if(currentItem == numberOfItems -1){
                    currentItem = 0;
                }else{
                    currentItem++;
                }

            }, itemInterval);
        }
    };
 
    var rotatingImages = [
      '/img/landscaping.png',
      '/img/warehouse.png',
      '/img/office_2.png',
      '/img/art_gallery.png',
      '/img/landscaping_2.png',
      '/img/office_3.png',
      '/img/manufacturing.png',
      '/img/office.png'
    ];

    BackgroundRotator.init($('.image-rotator'), rotatingImages);
});