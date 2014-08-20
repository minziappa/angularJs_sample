<#import "layout/bootstrapLayout.ftl" as layout>
<@layout.myLayout>
		<script type="text/javascript">
		angular.module('plunker', ['ui.bootstrap']);

		var TabsDemoCtrl = function ($scope) {
			  $scope.tabs = [
			    { title:'Dynamic Title 1', content:'Dynamic content 1' },
			    { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
			  ];

			  $scope.alertMe = function() {
			    setTimeout(function() {
			      alert('You\'ve selected the alert tab!');
			    });
			  };
			};
		</script>
  <div><h1>${test}</h1></div>
</@layout.myLayout>