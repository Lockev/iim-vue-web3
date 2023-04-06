import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Home.vue'),
  },

  {
    path: '/me',
    name: 'Me',
    component: () => import('../views/Me.vue'),
  },

  {
    path: '/buy',
    name: 'Buy',
    component: () => import('../views/Buy.vue'),
  },

  {
    path: '/nft',
    name: 'NFT',
    component: () => import('../views/NFT.vue'),
  }
  // TODO: for 404 errors
  // {
  //   path: '/:catchAll(.*)',
  //   component: NotFoundComponent,
  //   name: 'NotFound',
  // },
]

const router = createRouter({
  history: createWebHistory(),

  routes,
})

export default router
