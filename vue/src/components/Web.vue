<template>

  <div>
    <canvas id="c"></canvas>
  </div>

</template>
 
<script>
export default {
    name: 'web',
    data() {
      return {
        error: false,
        loading: false,
      }
    },
    mounted: function() {
      c.run()
      this.get_req({})
    },
    created: function() {
    },
    methods: {
      get_req:function(r){
        return new Promise((resolve,reject)=>{
          this.loading = true
          fetch(this.$api + '/stuff', {
              method: 'GET',
              headers: {
                'Content-Type': 'application/json',
                'Authorization': this.get_auth_header()
              },
            })
            .then(res => res.json()) 
            .then(data => {
              this.loading = false;
              console.log(data)
              resolve(data)
            })
          })
      },
    },
  }
</script>

<style>


</style>
