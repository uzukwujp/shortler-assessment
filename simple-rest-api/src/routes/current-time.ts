
import { Router } from "express";

import { currentTime } from "../controllers/current-time";

const currentTimeRounter = Router()

currentTimeRounter
.get("/",
 currentTime
)

export default currentTimeRounter;
