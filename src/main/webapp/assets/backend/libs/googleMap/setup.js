;
(function(root, factory) {
	if (typeof define === 'function' && define.amd) {
		define([ 'jquery' ], factory);
	} else if (typeof exports === 'object') {
		module.exports = factory(require('jquery'));
	} else {
		root.MyMap = factory(root.jQuery);
	}
}(this, function($) {
	var pluginName = "mymap";
	function MyMap(element, options) {
		if (!google.maps.Geocoder)
			return;

		var defaults = {
			coordinate : {
				lat : -34.397,
				lng : 150.644
			},
			zoom : 13,
			marker : {
				draggable : true
			},
			outId : {
				lat : '',
				lng : '',
			},
			search : ''
		}

		this.element = element;
		this.input = $(element);
		this.settings = $.extend(true, defaults, options, this.input
				.data('mymap'));
		this.geocoder = new google.maps.Geocoder();
		if (this.settings.outId.lat != '' && this.settings.outId.lng != '') {
			this.latInput = $('#' + this.settings.outId.lat);
			this.lngInput = $('#' + this.settings.outId.lng);
		}
		
		if(this.settings.coordinate.lat == 0 || this.settings.coordinate.lng == 0){
			this.settings.coordinate = defaults.coordinate;
		}

		this.onSearch = this.onSearch.bind(this);
		this.toggleBounce = this.toggleBounce.bind(this);

		this.initMap()

		if (this.settings.search != "") {
			this.searchInput = $("#" + this.settings.search);
			this.searchInput.on("change", this.onSearch);
		}

	}

	MyMap.prototype.initMap = function() {
		this.map = new google.maps.Map(this.element, {
			center : this.settings.coordinate,
			zoom : this.settings.zoom,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		if (typeof this.settings.marker != "object")
			return;

		this.marker = new google.maps.Marker({
			map : this.map,
			draggable : this.settings.marker.draggable,
			animation : google.maps.Animation.DROP,
			position : this.settings.coordinate
		});

		this.marker.addListener('click', this.toggleBounce);

	}

	MyMap.prototype.onSearch = function() {

		if (this.map == undefined || this.marker == undefined
				|| this.searchInput.val() < 5)
			return;
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : this.searchInput.val()
		}, function(results, status) {

			if (status == google.maps.GeocoderStatus.OK) {
				this.settings.coordinate.lat = results[0].geometry.location
						.lat();
				this.settings.coordinate.lng = results[0].geometry.location
						.lng();
			}
		});
		this.initMap();
	}

	MyMap.prototype.toggleBounce = function() {
		if (this.marker.getAnimation() !== null) {
			this.marker.setAnimation(null);
		} else {
			this.marker.setAnimation(google.maps.Animation.BOUNCE);
			this.latInput.val(this.marker.center.lat());
			this.lngInput.val(this.marker.center.lng());
		}
	}

	$.fn[pluginName] = function(options) {
		this.each(function() {
			if (!$.data(this, pluginName)) {
				$.data(this, pluginName, new MyMap(this, options));
			}
		});

		return this;
	};

	return MyMap;
}));