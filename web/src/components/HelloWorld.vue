<template>
  <div class="hello">
    <h1>{{msg}}</h1>
    <h2>The list below is from a server response:</h2>
    <ul>
      <li v-for="todo in todoList">
        <h1>{{todo.title}}</h1>
        <span>{{todo.description}}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Simple project design with VUE.JS and GOLANG.',
      todoList: []
    }
  },
  created: function () {
    this.$http.get('http://localhost:8080/list')
      .then(res => {
        this.todoList = res.body
      })
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  padding: 0;
}
li {
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
