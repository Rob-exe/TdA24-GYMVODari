import type { NextApiRequest, NextApiResponse } from "next";

type ResponseData = {
	message: string
}


export default function api(
	req: NextApiRequest,
	res: NextApiResponse
) {
    res.status(200).json({"secret":"the cake is a lie"})
}
