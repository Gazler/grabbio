grabbio gem
==============
The [grabbio platform](http://grabb.io) is an API that allows you to generate
thumbnails in a variety of styles.

Installation
------------

    gem install grabbio

Usage
-----

###Basic

In its most basic form, the only required parameters are source, upload_url and
your api keys.

    grabbio = Grabbio.new(YOUR_API_KEY, YOUR_API_SECRET);
    grabbio.grab(SOURCE_URL, UPLOAD_URL)

###Advanced

All the parameters in the [grabbio documentation](http://grabb.io/documentation)
are supported and passed through as a parameters hash.  Here are a few examples:

####320x240 Gif, Capsheet and Individual uploaded to an S3 bucket in developer mode
    grabbio = Grabbio.new(YOUR_API_KEY, YOUR_API_SECRET);
    grabbio.grab(SOURCE_URL, UPLOAD_URL,    :developer_mode => true,
                                            :gif_framerate => 30,
                                            :thumbnail_styles => "individual,gif,capsheet",
                                            :capsheet_columns => 3,
                                            :width => 320,
                                            :height => 240)

####180x240 Capsheet uploaded to FTP with a callback
    grabbio = Grabbio.new(YOUR_API_KEY, YOUR_API_SECRET);
    grabbio.grab(SOURCE_URL, UPLOAD_URL,    :thumbnail_styles => "capsheet",
                                            :width => 180,
                                            :height => 240,
                                            :callback_url => CALLBACK_URL)

####Return
All calls return an object if the request is valid, otherwise a GrabbioError is raised
with the error message retured from the site.

The response object looks like:
    {"video"=>
        {"callback_url"=>nil,
        "cost"=>1,
        "created_at"=>"2011-04-08T12:28:34Z",
        "developer_mode"=>false,
        "external_id"=>nil,
        "filename"=>"CxRcyVX70y",
        "id"=>311,
        "number_of_thumbnails"=>1,
        "scale_mode"=>"pad",
        "source"=>"http://example.com/video.avi",
        "source_type"=>"http",
        "status"=>"pending",
        "thumbnail_format"=>"jpg",
        "thumbnail_types"=>"individual",
        "updated_at"=>"2011-04-08T12:28:34Z",
        "upload_placeholders"=>true,
        "upload_type"=>"s3",
        "requested_thumbnails"=>
            [{
            "thumbnail"=>
                {"created_at"=>"2011-04-08T12:28:36Z",
                "filename"=>"CxRcyVX70y_120x90_0.jpg",
                "height"=>90, "id"=>1165,
                "order"=>0,
                "thumbnail_type"=>"individual",
                "updated_at"=>"2011-04-08T12:28:36Z",
                "video_id"=>311,
                "width"=>120}
             }]
         }
     }



Example Thumbnails
------------------
###Individual
![Individual Thumbnail](http://grabb.io/images/individual_example_0.jpg)
![Individual Thumbnail](http://grabb.io/images/individual_example_1.jpg)
![Individual Thumbnail](http://grabb.io/images/individual_example_2.jpg)
![Individual Thumbnail](http://grabb.io/images/individual_example_3.jpg)
![Individual Thumbnail](http://grabb.io/images/individual_example_4.jpg)
![Individual Thumbnail](http://grabb.io/images/individual_example_5.jpg)

###Gif
![GIF](http://grabb.io/images/gif_example.gif)

###Capsheet
![Capsheet Example](http://grabb.io/images/capsheet_example.jpg)

