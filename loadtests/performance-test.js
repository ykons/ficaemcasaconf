// performance-test.js

import { sleep } from "k6";
import http from "k6/http";

export let options = {
  duration: "30s",
  vus: 50
};

export default function() {
  http.get("http://ficaemcasaconf.demo.51.91.174.12.xip.io");
  sleep(1);
}