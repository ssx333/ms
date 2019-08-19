<template>
  <div id="app">
    <router-view>
    </router-view>
    <navbar></navbar>
  </div>
</template>
<script>
import navbar from './components/Navbar'
export default {
components: {
    navbar
  }
}
</script>

<style>

</style>
