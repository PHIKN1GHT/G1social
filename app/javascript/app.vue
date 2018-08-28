<template>
  <div id="app">
    <navigator></navigator>
    <container></container>
  </div>
</template>

<script>
import Navigator from 'navigator.vue'
import Container from 'container.vue'
export default {
  components: {
    "navigator" : Navigator,
    "container" : Container,
  },
  methods:{
  }

}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
