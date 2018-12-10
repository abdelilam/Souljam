import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';

document.querySelectorAll(".participant").forEach((participant) => {
  const id = participant.dataset.id;
  const html = document.getElementById(`participant-tooltip-${id}`).innerHTML;
  tippy(`#participant-${id}`, {
    content: html,
    arrow: true
  });
});
