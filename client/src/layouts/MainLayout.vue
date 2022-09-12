<template>
  <q-layout view="lHh Lpr lFf">
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
export default {
  name: "LayoutMain",

  components: {
  },

  mounted()
  {
   if (this.$route.path === "/")
    {
      this.$router.push({ name: "home" });
    }
  },
};
</script>
