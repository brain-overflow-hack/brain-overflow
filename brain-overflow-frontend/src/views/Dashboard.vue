<template>
  <span>
  <navbar />
  <div class="container">
    <div class="row-col-2">
      <div class="col text-center mt-5">
        <h5> Количество побед за месяц в течение последних трех лет</h5>
        <graphic-card-win />      
      </div>
      <div class="col text-center mt-5">
        <h5> Количество участий в тендерах за месяц в течение последних трех лет</h5>
        <graphic-card-all />      
      </div>
      <div class="col text-center mt-5">
        <h5> Сумма стоимостей заключенных контрактов за месяц в течение последних трех лет</h5>
        <graphic-card-sum />      
      </div>
    </div>
</div>
</span>
</template>

<script>
import GraphicCardWin from '../components/GraphicCardWin.vue';
import GraphicCardAll from '../components/GraphicCardAll.vue';
import Navbar from '../components/Navbar.vue';
import GraphicCardSum from '../components/GraphicCardSum.vue';

export default{
 components: {GraphicCardWin, Navbar, GraphicCardSum, GraphicCardAll},
}
</script>

