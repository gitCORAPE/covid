import aws from 'aws-sdk';


const s3 = new aws.S3();

export const uploadFileToS3 = async(params:any): Promise<any> => s3.upload(params).promise();

export const checkS3FileExistance = async(params:any): Promise<any> => s3.headObject(params).promise();
