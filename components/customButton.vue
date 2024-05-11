<template>
  <a :class="buttonClasses" :href="link">{{ label }}</a>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true
    },
    link: {
      type: String,
      required: true
    },
    variant: {
      type: String,
      default: 'primary' // Default variant
    }
  },
  computed: {
    buttonClasses() {
      return [
        'rounded-lg',
        'px-4',
        'py-2',
        'justify-center',
        'items-center',
        'gap-4',
        this.variant === 'primary' ? 'text-white bg-[#61A5C2] border-2 border-solid border-[#013A63] flex' : this.variant === 'secondary' ? 'bg-[#EAF5FA] border border-blue-400 text-blue-400 shadow-md flex' : 'bg-blue-100 border border-blue-400 text-blue-400 shadow-md flex',
        'w-80'
      ];
    }
  }
};
</script>
