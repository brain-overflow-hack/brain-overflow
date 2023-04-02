<template>
  <span>
  <navbar />
  <div class="container">
    <div class="row-col-2">
      <div class="col">
        <graphic-card-win />      
      </div>
      <div class="col">
        <graphic-card-all />      
      </div>
      <div class="col">
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

