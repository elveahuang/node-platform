import { createParamDecorator } from '@nestjs/common';
import { isEqual, lowerCase } from 'lodash';
import { PaginationInterface } from '@platform/server/commons/types/pagination.interface';

const FIRST_PAGE_NUMBER: number = 1;
const DEFAULT_PAGE_SIZE: number = 12;
const MAX_PAGE_SIZE: number = 100;
const MIN_PAGE_SIZE: number = 1;

export const Pagination = createParamDecorator((data, req): PaginationInterface => {
    let limit: number = 0;
    let page: number = 0;

    if (isEqual(lowerCase(req.method), 'get')) {
        // Get
        console.log(`req.query.limit - ${req.query.limit}`);
        console.log(`req.query.page - ${req.query.page}`);

        req.query.limit =
            typeof req.query.limit === 'number' ? req.query.limit : parseInt(req.query.limit, 10) || DEFAULT_PAGE_SIZE;
        req.query.page =
            typeof req.query.page === 'number' ? req.query.page : parseInt(req.query.page, 10) || FIRST_PAGE_NUMBER;

        if (req.query.limit > MAX_PAGE_SIZE) {
            req.query.limit = MAX_PAGE_SIZE;
        } else if (req.query.limit < MIN_PAGE_SIZE) {
            req.query.limit = MIN_PAGE_SIZE;
        }

        page = req.query.page;
        limit = req.query.limit;
    } else if (isEqual(lowerCase(req.method), 'post')) {
        // Post
        console.log(`req.body.limit - ${req.body.limit}`);
        console.log(`req.body.page - ${req.body.page}`);
        req.body.limit =
            typeof req.body.limit === 'number' ? req.body.limit : parseInt(req.body.limit, 10) || DEFAULT_PAGE_SIZE;
        req.body.page =
            typeof req.body.page === 'number' ? req.body.page : parseInt(req.body.page, 10) || FIRST_PAGE_NUMBER;

        if (req.body.limit > MAX_PAGE_SIZE) {
            req.body.limit = MAX_PAGE_SIZE;
        } else if (req.body.limit < MIN_PAGE_SIZE) {
            req.body.limit = MIN_PAGE_SIZE;
        }

        page = req.body.page;
        limit = req.body.limit;
    }

    const offset: number = (page - 1) * limit;

    console.log(`page - ${page}`);
    console.log(`limit - ${limit}`);
    console.log(`offset - ${offset}`);
    return {
        limit: limit,
        page: page,
        offset: offset,
    };
});
