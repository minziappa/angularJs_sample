<div ng-controller="TabsDemoCtrl">
  <tabset justified="true">
    <tab heading="Menu1">contents1.ftl</tab>
    <tab heading="Menu2">contents2.ftl</tab>
    <tab heading="Menu3"><#include "../contents/contents3.ftl"/></tab>
  </tabset>
</div>