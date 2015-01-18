'use strict';

require('../templates');

/**
 * @ngInject
 */
function ExampleDirective() {

  return {
    restrict: 'EA',
    // templateCacheの内容を使うにはどうするんだろう・・・
    template: 'Example Directive Template 直書き',
    link: function($scope, $element) {
      $element.on('click', function() {
        alert('element clicked');
      });
    }
  };

}

module.exports = ExampleDirective;